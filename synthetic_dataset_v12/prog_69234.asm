; DESCRIPTION: Places a red 82x48 rectangle at position (4, 28).
; PLAN: r0=4(x), r1=28(y), r2=82(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 28
LDI r2, 82
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
