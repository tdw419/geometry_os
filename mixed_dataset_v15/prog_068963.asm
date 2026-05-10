; DESCRIPTION: Places a green 46x100 rectangle at position (66, 16).
; PLAN: r0=66(x), r1=16(y), r2=46(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 16
LDI r2, 46
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
