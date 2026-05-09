; DESCRIPTION: Places a blue circle of radius 42 at center (296, 62).
; PLAN: r0=296(x), r1=62(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 62
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
