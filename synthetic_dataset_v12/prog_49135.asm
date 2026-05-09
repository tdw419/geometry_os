; DESCRIPTION: Renders a green box of size 71x21 starting at (392, 233).
; PLAN: r0=392(x), r1=233(y), r2=71(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 233
LDI r2, 71
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
