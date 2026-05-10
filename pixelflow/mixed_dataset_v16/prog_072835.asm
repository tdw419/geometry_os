; DESCRIPTION: Places a yellow 90x39 rectangle at position (46, 52).
; PLAN: r0=46(x), r1=52(y), r2=90(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 52
LDI r2, 90
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
