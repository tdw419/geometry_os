; DESCRIPTION: Places a white 65x66 rectangle at position (248, 27).
; PLAN: r0=248(x), r1=27(y), r2=65(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 27
LDI r2, 65
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
