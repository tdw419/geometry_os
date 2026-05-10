; DESCRIPTION: Renders a black box of size 86x32 starting at (387, 111).
; PLAN: r0=387(x), r1=111(y), r2=86(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 111
LDI r2, 86
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
