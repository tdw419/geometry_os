; DESCRIPTION: Places a red 92x44 rectangle at position (317, 19).
; PLAN: r0=317(x), r1=19(y), r2=92(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 19
LDI r2, 92
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
