; DESCRIPTION: Places a yellow 66x44 rectangle at position (366, 193).
; PLAN: r0=366(x), r1=193(y), r2=66(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 193
LDI r2, 66
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
