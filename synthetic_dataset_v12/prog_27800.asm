; DESCRIPTION: Places a green 98x19 rectangle at position (320, 46).
; PLAN: r0=320(x), r1=46(y), r2=98(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 46
LDI r2, 98
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
