; DESCRIPTION: Places a yellow 54x11 rectangle at position (229, 225).
; PLAN: r0=229(x), r1=225(y), r2=54(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 225
LDI r2, 54
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
