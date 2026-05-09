; DESCRIPTION: Renders a yellow box of size 47x42 starting at (255, 24).
; PLAN: r0=255(x), r1=24(y), r2=47(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 24
LDI r2, 47
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
