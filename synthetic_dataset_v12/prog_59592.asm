; DESCRIPTION: Renders a cyan box of size 32x120 starting at (286, 30).
; PLAN: r0=286(x), r1=30(y), r2=32(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 30
LDI r2, 32
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
