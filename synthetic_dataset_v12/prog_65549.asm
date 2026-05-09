; DESCRIPTION: Places a cyan 98x80 rectangle at position (172, 46).
; PLAN: r0=172(x), r1=46(y), r2=98(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 46
LDI r2, 98
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
