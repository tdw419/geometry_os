; DESCRIPTION: Fills the screen with a vertical blue gradient from dark to bright.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(width), r4=256(height), r7=0x0000FF(color). CMP stores result in r0.
LDI r7, 0x0000FF
LDI r1, 0
JNZ r1, 0
JNZ r1, loop_
LDI r2, 1
ADD r2, r1
HALT
