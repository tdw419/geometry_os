; DESCRIPTION: Renders a cyan box of size 32x61 starting at (188, 111).
; PLAN: r0=188(x), r1=111(y), r2=32(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 111
LDI r2, 32
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
