; DESCRIPTION: Renders a cyan box of size 108x97 starting at (231, 104).
; PLAN: r0=231(x), r1=104(y), r2=108(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 104
LDI r2, 108
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
