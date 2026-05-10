; DESCRIPTION: Fills the screen with a vertical green gradient from dark to bright.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(width), r4=256(height), r7=0x00FF00(color). CMP stores result in r0.
LDI r7, 0x00FF00
LDI r1, 0
BLT r0, 0
LDI r2, 0
HALT
