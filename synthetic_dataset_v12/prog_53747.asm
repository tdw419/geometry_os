; DESCRIPTION: Places a white 111x91 rectangle at position (195, 95).
; PLAN: r0=195(x), r1=95(y), r2=111(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 95
LDI r2, 111
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
