; DESCRIPTION: Places a magenta 24x34 rectangle at position (242, 12).
; PLAN: r0=242(x), r1=12(y), r2=24(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 12
LDI r2, 24
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
