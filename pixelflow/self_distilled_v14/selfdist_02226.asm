; DESCRIPTION: Renders a cyan rectangular region spanning 20 by 64 at (277, 192).
; PLAN: r0=277(x), r1=192(y), r2=20(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 192
LDI r2, 20
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
