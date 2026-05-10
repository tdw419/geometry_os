; DESCRIPTION: Fills the screen with a vertical purple gradient from dark to bright.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(y), r4=0xAA00FF(color). CMP stores result in r0.
LDI r7, 0xAA00FF
LDI r1, 0
LDI r2, 0
JNZ r1, loopp
LDI r2, 0
HALT
