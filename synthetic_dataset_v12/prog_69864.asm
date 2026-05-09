; DESCRIPTION: Places a cyan 82x56 rectangle at position (112, 186).
; PLAN: r0=112(x), r1=186(y), r2=82(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 186
LDI r2, 82
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
