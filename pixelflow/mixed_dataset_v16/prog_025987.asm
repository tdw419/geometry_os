; DESCRIPTION: Composite: Places a red 92x51 rectangle at position (240, 71) then Sets a single red pixel at (410, 173).
; PLAN: r0=240(x), r1=71(y), r2=92(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=173(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 240
LDI r1, 71
LDI r2, 92
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 173
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
