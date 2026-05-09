; DESCRIPTION: Places a white 102x68 rectangle at position (405, 144).
; PLAN: r0=405(x), r1=144(y), r2=102(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 144
LDI r2, 102
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
