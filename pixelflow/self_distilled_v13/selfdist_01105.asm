; DESCRIPTION: Renders a cyan rectangular region spanning 54 by 24 at (262, 47).
; PLAN: r0=262(x), r1=47(y), r2=54(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 47
LDI r2, 54
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
