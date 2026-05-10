; DESCRIPTION: Creates a cyan filled rectangle of size 51x110 starting at (197, 22).
; PLAN: r0=197(x), r1=22(y), r2=51(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 22
LDI r2, 51
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
