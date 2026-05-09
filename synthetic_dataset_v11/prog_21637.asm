; DESCRIPTION: Renders a green box of size 94x48 starting at (48, 16).
; PLAN: r0=48(x), r1=16(y), r2=94(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 16
LDI r2, 94
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
