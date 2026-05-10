; DESCRIPTION: Places a white 95x90 rectangle at position (276, 47).
; PLAN: r0=276(x), r1=47(y), r2=95(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 47
LDI r2, 95
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
