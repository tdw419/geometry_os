; DESCRIPTION: Composite: Places a cyan 14x100 rectangle at position (152, 71) then Sets a single red pixel at (288, 118).
; PLAN: r0=152(x), r1=71(y), r2=14(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=118(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 71
LDI r2, 14
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 118
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
