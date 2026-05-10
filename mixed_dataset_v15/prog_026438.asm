; DESCRIPTION: Places a red 47x109 rectangle at position (332, 27).
; PLAN: r0=332(x), r1=27(y), r2=47(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 27
LDI r2, 47
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
