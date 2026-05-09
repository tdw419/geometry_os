; DESCRIPTION: Places a yellow 39x23 rectangle at position (275, 80).
; PLAN: r0=275(x), r1=80(y), r2=39(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 80
LDI r2, 39
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
