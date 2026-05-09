; DESCRIPTION: Places a yellow 54x21 rectangle at position (393, 226).
; PLAN: r0=393(x), r1=226(y), r2=54(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 226
LDI r2, 54
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
