; DESCRIPTION: Creates a cyan filled rectangle of size 88x99 starting at (327, 146).
; PLAN: r0=327(x), r1=146(y), r2=88(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 146
LDI r2, 88
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
