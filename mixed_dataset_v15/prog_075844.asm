; DESCRIPTION: Fills the screen with a vertical orange gradient from dark to bright.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(y), r4=0xFF8800(color). CMP stores result in r0.
LDI r7, 0xFF8800
LDI r1, 0
LDI r2, 0
JNZ r1, loop
HALT
