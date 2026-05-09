; DESCRIPTION: Places a yellow 65x52 rectangle at position (395, 29).
; PLAN: r0=395(x), r1=29(y), r2=65(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 29
LDI r2, 65
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
