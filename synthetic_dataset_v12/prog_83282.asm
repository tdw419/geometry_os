; DESCRIPTION: Places a blue 98x86 rectangle at position (406, 121).
; PLAN: r0=406(x), r1=121(y), r2=98(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 121
LDI r2, 98
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
