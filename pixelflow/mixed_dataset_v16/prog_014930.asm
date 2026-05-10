; DESCRIPTION: Creates a green filled rectangle of size 106x39 starting at (379, 143).
; PLAN: r0=379(x), r1=143(y), r2=106(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 143
LDI r2, 106
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
