; DESCRIPTION: Creates a yellow filled rectangle of size 57x16 starting at (146, 9).
; PLAN: r0=146(x), r1=9(y), r2=57(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 9
LDI r2, 57
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
