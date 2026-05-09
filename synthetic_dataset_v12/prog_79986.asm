; DESCRIPTION: Places a green 85x86 rectangle at position (386, 147).
; PLAN: r0=386(x), r1=147(y), r2=85(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 147
LDI r2, 85
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
