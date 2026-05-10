; DESCRIPTION: Draws a magenta cross in the center of the screen (horizontal + vertical lines). CMP (readonly), r1=0(y), r2=0xFF00FF(color). CMP stores result in a.
LDI r7, 0xFF00FF
PSET r0, r1, r2
HALT
