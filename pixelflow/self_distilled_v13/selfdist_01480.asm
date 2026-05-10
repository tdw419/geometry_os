; DESCRIPTION: Renders a cyan rectangular region spanning 54 by 23 at (264, 44).
; PLAN: r0=264(x), r1=44(y), r2=54(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 44
LDI r2, 54
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
