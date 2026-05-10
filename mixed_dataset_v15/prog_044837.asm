; DESCRIPTION: Places a yellow 41x21 rectangle at position (59, 185).
; PLAN: r0=59(x), r1=185(y), r2=41(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 185
LDI r2, 41
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
