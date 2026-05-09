; DESCRIPTION: Places a yellow 108x80 rectangle at position (277, 130).
; PLAN: r0=277(x), r1=130(y), r2=108(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 130
LDI r2, 108
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
