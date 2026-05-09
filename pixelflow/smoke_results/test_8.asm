; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
; PLAN: r0=0x), r1=8(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 0x000000
FILL r0
HALT