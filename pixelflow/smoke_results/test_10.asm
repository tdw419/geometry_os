; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(width), r4=0xFFFFFF(color). CMP stores result in r0.
LDI r7, 0xFFFFFF
LDI r1, 0
LDI r2, 0
LDI r5, 0
JNZ r1, loop
LDI r5, 0