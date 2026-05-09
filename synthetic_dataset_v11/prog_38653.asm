; DESCRIPTION: Places a orange 39x13 rectangle at position (125, 243).
; PLAN: r0=125(x), r1=243(y), r2=39(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 243
LDI r2, 39
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
