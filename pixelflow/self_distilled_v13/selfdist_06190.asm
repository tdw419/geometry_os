; DESCRIPTION: Renders a cyan rectangular region spanning 61 by 52 at (175, 197).
; PLAN: r0=175(x), r1=197(y), r2=61(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 197
LDI r2, 61
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
