; DESCRIPTION: Fills the screen with a vertical magenta gradient from dark to bright.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(width), r3=512(height), r4=0xFF00FF(color). CMP stores result in r0.
LDI r7, 0xFF00FF
LDI r1, 0
LDI r2, 0
JNZ r1, 0
JNZ r1, loop_
HALT
