; DESCRIPTION: Renders a orange disk with center (392, 197) and radius 42.
; PLAN: r0=392(x), r1=197(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 197
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
