; DESCRIPTION: Places a green 39x44 rectangle at position (169, 103).
; PLAN: r0=169(x), r1=103(y), r2=39(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 103
LDI r2, 39
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
