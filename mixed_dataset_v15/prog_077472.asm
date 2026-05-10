; DESCRIPTION: Places a white 65x60 rectangle at position (445, 192).
; PLAN: r0=445(x), r1=192(y), r2=65(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 192
LDI r2, 65
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
