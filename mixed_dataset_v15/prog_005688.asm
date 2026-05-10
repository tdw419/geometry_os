; DESCRIPTION: Fills the screen with a vertical magenta gradient from dark to bright.
; PLAN: r0=0(x), r1=0(y), r2=0(x), r3=512(y), r4=0xFF00FF(color). CMP stores result in r0.
LDI r7, 0xFF00FF
PSET r0, r1, r7
HALT
