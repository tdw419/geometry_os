; DESCRIPTION: Renders a cyan rectangular region spanning 71 by 100 at (328, 91).
; PLAN: r0=328(x), r1=91(y), r2=71(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 91
LDI r2, 71
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
