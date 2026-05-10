; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
; PLAN: r0=128(x), r1=128(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 128
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT