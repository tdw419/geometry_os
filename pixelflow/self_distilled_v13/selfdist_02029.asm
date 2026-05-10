; DESCRIPTION: Creates a cyan filled rectangle of size 120x99 starting at (302, 72).
; PLAN: r0=302(x), r1=72(y), r2=120(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 72
LDI r2, 120
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
