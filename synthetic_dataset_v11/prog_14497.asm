; DESCRIPTION: Places a yellow 114x87 rectangle at position (46, 68).
; PLAN: r0=46(x), r1=68(y), r2=114(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 68
LDI r2, 114
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
